### **Overview**

This script is a **Knowledge Based System (KBS)** built using Python. It acts as an expert "Macadamia Doctor" that can diagnose problems and prescribe treatments.

It bridges two technologies:

1.  **Streamlit:** A web framework that creates the user interface (buttons, dropdowns).
2.  **Z3 Theorem Prover:** A logic engine from Microsoft Research that performs the actual reasoning.

-----

### **How It Works (Step-by-Step)**

#### **1. The Setup (Engine Initialization)**

  * **Code:** `fp = Fixedpoint()` and `fp.set(engine='datalog')`
  * **Explanation:** Instead of using Z3 to solve algebra equations, we configure it to work like a **Database**. The "Fixedpoint" engine allows us to define relationships (tables) and facts (rows), similar to SQL or Prolog.
  * **Data Types:** We define a custom type `Thing = BitVecSort(32)`. This tells Z3 to treat every disease, symptom, and drug as a unique 32-bit number (ID) internally, which makes calculations extremely fast.

#### **2. The Translation Layer (Mapping)**

  * **Code:** `get_id(text)` and `get_name(val)`
  * **Explanation:** Z3 speaks "Math," but users speak "English."
      * When the CSV says "Root Rot," `get_id` assigns it a unique number (e.g., `1`).
      * When Z3 finds a solution `1`, `get_name` translates it back to "Root Rot" for the user.

#### **3. Building the Knowledge Base (Loading Facts)**

  * **Code:** The `load_kb` function reading `macadamia.csv`.
  * **Explanation:** The script reads your spreadsheet row by row and asserts mathematical truths into the Z3 engine.
      * *Logic:* `fp.fact(has_symptom(1, 50))`
      * *Translation:* "It is a fact that Disease \#1 causes Symptom \#50."
  * **File Generation:** While loading, it simultaneously writes these facts into a text file (`macadamia_facts.z3`). This serves as a "hard copy" of the logic

#### **4. The Logic Rules (Inference)**

  * **Code:**
    ```python
    fp.rule(cures_symptom(t, s), [treated_with(t, d), has_symptom(d, s)])
    ```
  * **Explanation:** This is the "Brain" of the system. We teach Z3 a rule it cannot find in the CSV directly:
    > "If a Treatment (**t**) fights a Disease (**d**), AND that Disease (**d**) causes a Symptom (**s**), THEN that Treatment (**t**) cures the Symptom (**s**)."
  * This allows the system to make **logical leaps**. It connects the "Symptom" column to the "Treatment" column via the "Disease" name.

#### **5. The Query System (Solving)**

The app has two modes of operation:

  * **Mode A: Symptom Checker (Reverse Reasoning)**

      * **Input:** User selects "Yellowing leaves".
      * **Diagnosis Query:** `fp.query(has_symptom(d, yellowing_id))`
          * *Question:* "Find me every Disease **d** linked to this symptom."
      * **Prescription Query:** `fp.query(cures_symptom(t, yellowing_id))`
          * *Question:* "Find me every Treatment **t** that satisfies the logic rule we defined in Step 4."

  * **Mode B: Disease Encyclopedia (Forward Verification)**

      * **Input:** User selects "Anthracnose".
      * **Query:** The script asks Z3 to retrieve all facts where `has_symptom` or `treated_with` matches the specific ID of Anthracnose.

#### **6. The Output Parsing**

  * **Code:** `parse_results(fp.get_answer())`
  * **Explanation:** Z3 returns answers as a complex mathematical tree. This helper function walks through that tree, finds the specific ID numbers, and converts them back to text for the user.

-----

### **Why use Z3 instead of just Python lists?**

If you just used Python lists, you would have to write `for` loops to search for data. By using Z3:

1.  **Verification:** You verify the logical consistency of your data.
2.  **Scalability:** You can add complex rules (e.g., "Don't use Drug X if temperature \> 30°C") without rewriting your code; you just add one logic line.
3.  **Formal Proof:** The system doesn't just "guess"; it mathematically *proves* that a treatment is valid based on your constraints.