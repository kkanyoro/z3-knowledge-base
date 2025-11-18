import streamlit as st
import csv
import ast
from z3 import *

# --- PAGE CONFIG ---
st.set_page_config(page_title="Macadamia Doctor", page_icon="🌰")
st.title(" Macadamia Knowledge Base")
st.markdown("Select a symptom below to find the mathematically proven treatment.")

# --- CACHING ---
# We use @st.cache_resource so Z3 only loads the data ONCE, not every time you click a button.
@st.cache_resource
def load_knowledge_base():
    # 1. SETUP Z3
    fp = Fixedpoint()
    fp.set(engine='datalog')
    Thing = BitVecSort(32)
    
    str_to_id = {}
    id_to_str = {}
    id_counter = 1

    def get_id(text):
        nonlocal id_counter
        if not text: return None
        clean_text = text.strip().strip("'").strip('"')
        if clean_text not in str_to_id:
            val = BitVecVal(id_counter, Thing)
            str_to_id[clean_text] = val
            id_to_str[id_counter] = clean_text
            id_counter += 1
        return str_to_id[clean_text]

    def get_name(z3_val):
        try:
            return id_to_str.get(z3_val.as_long(), str(z3_val))
        except:
            return str(z3_val)

    # 2. DEFINE RELATIONS
    is_type = Function('is_type', Thing, Thing, BoolSort())
    caused_by = Function('caused_by', Thing, Thing, BoolSort())
    has_symptom = Function('has_symptom', Thing, Thing, BoolSort())
    treated_with = Function('treated_with', Thing, Thing, BoolSort())

    fp.register_relation(is_type)
    fp.register_relation(caused_by)
    fp.register_relation(has_symptom)
    fp.register_relation(treated_with)

    # 3. LOAD DATA
    all_symptoms = set() # Keep track of symptoms for the Dropdown menu
    
    try:
        with open('macadamia.csv', mode='r', encoding='utf-8-sig') as file:
            reader = csv.DictReader(file)
            for row in reader:
                subject = get_id(row['name'])
                
                if row.get('type'): fp.fact(is_type(subject, get_id(row['type'])))
                if row.get('causal_agent'): fp.fact(caused_by(subject, get_id(row['causal_agent'])))
                
                if row.get('symptoms'):
                    try:
                        for sym in ast.literal_eval(row['symptoms']):
                            fp.fact(has_symptom(subject, get_id(sym)))
                            all_symptoms.add(sym) # Add to list for UI
                    except: pass

                if row.get('treatments'):
                    try:
                        for treat in ast.literal_eval(row['treatments']):
                            fp.fact(treated_with(get_id(treat), subject))
                    except: pass
    except FileNotFoundError:
        st.error("CSV File not found!")
        return None, None, None, None

    # 4. REGISTER RULES
    t, d, s = Consts('t d s', Thing)
    fp.declare_var(t, d, s)
    
    cures_symptom = Function('cures_symptom', Thing, Thing, BoolSort())
    fp.register_relation(cures_symptom)
    fp.rule(cures_symptom(t, s), [treated_with(t, d), has_symptom(d, s)])
    
    return fp, cures_symptom, get_id, get_name, sorted(list(all_symptoms))

# --- LOAD THE ENGINE ---
fp, cures_symptom_rel, get_id_fn, get_name_fn, symptoms_list = load_knowledge_base()

if fp:
    # --- USER INTERFACE ---
    # Dropdown menu (No more typos!)
    selected_symptom = st.selectbox("What is the symptom?", symptoms_list)
    
    if st.button("Find Treatment"):
        # --- QUERY LOGIC ---
        Thing = BitVecSort(32)
        q = Const('q', Thing)
        fp.declare_var(q)
        
        target_id = get_id_fn(selected_symptom)
        result = fp.query(cures_symptom_rel(q, target_id))
        
        st.divider()
        
        if result == sat:
            st.success(f"Treatments found for: **{selected_symptom}**")
            ans = fp.get_answer()
            arg = ans.arg(0)
            
            results = []
            if arg.num_args() > 0:
                for i in range(arg.num_args()):
                    results.append(get_name_fn(arg.arg(i)))
            else:
                results.append(get_name_fn(arg))
            
            for r in results:
                st.info(f" {r}")
        else:
            st.warning("No specific treatment found in the Knowledge Base.")