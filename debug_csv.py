import csv
import ast

filename = 'macadamia.csv' # Make sure this matches your file name

print(f"--- inspecting {filename} ---")

try:
    with open(filename, mode='r', encoding='utf-8-sig') as f:
        reader = csv.DictReader(f)
        
        # 1. CHECK HEADERS
        headers = reader.fieldnames
        print(f"Raw Headers found: {headers}")
        
        if 'symptoms' not in headers:
            print("\n❌ CRITICAL ERROR: 'symptoms' column not found!")
            print("Did you mean one of these?")
            for h in headers:
                if 'symptom' in h.lower():
                    print(f"  - '{h}' (Note the spaces or capitalization!)")
            exit()

        # 2. CHECK ROWS
        print("\nScanning rows for 'Necrosis'...")
        found = False
        line_num = 1 # Headers are line 1
        
        for row in reader:
            line_num += 1
            raw_symptoms = row.get('symptoms', '')
            
            # Check if this row contains our target text
            if 'Necrosis' in raw_symptoms:
                found = True
                print(f"\nFound 'Necrosis' on CSV Line {line_num}")
                print(f"Raw text in cell: [{raw_symptoms}]")
                
                # Try to parse it exactly like the script does
                try:
                    parsed = ast.literal_eval(raw_symptoms)
                    print("✅ Parsing Check: SUCCESS")
                    print(f"Python List: {parsed}")
                    
                    # Check if it's a list
                    if isinstance(parsed, list):
                        if "Necrosis of flowers" in parsed:
                            print("✅ Content Check: Item found in list.")
                        else:
                            print("⚠️ Content Check: List parsed, but specific string mismatch.")
                    else:
                         print(f"❌ Type Error: Expected a list, but got {type(parsed)}")
                         
                except Exception as e:
                    print(f"❌ Parsing Check: FAILED")
                    print(f"Error Details: {e}")
                    print("Hint: Look for mismatched quotes or brackets in the raw text.")

        if not found:
            print("\n❌ 'Necrosis' text was never found in the 'symptoms' column.")
            print("Check if it is in the wrong column (e.g., mismatching headers).")

except FileNotFoundError:
    print("File not found.")