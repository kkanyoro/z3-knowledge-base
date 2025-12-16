# Dr. Macadamia: Knowledge-Based System
**Dr. Macadamia** is a logic-based diagnostic tool designed to identify pests and diseases in macadamia nut trees. Unlike standard applications that simply retrieve stored data, this system utilizes **Microsoft Z3**, a powerful theorem prover, to perform logical inference and mathematical reasoning to deduce treatments.

---

## Table of Contents
- [Dr. Macadamia: Knowledge-Based System](#dr-macadamia-knowledge-based-system)
  - [Table of Contents](#table-of-contents)
  - [Project Overview](#project-overview)
  - [Key Features](#key-features)
    - [1. Symptom Checker (Diagnostic Mode)](#1-symptom-checker-diagnostic-mode)
    - [2. Disease Encyclopedia (Lookup Mode)](#2-disease-encyclopedia-lookup-mode)
    - [3. Auto-Generated Logic Proof](#3-auto-generated-logic-proof)
  - [Installation \& Setup](#installation--setup)
    - [Prerequisites](#prerequisites)
    - [1. Clone or Download the Project](#1-clone-or-download-the-project)
    - [2. Install Dependencies](#2-install-dependencies)
  - [How to Run](#how-to-run)
  - [System Architecture](#system-architecture)
    - [1. The Z3 Logic Engine](#1-the-z3-logic-engine)
    - [2. Logical Inference Rules](#2-logical-inference-rules)

---

## Project Overview
This project demonstrates how **Satisfiability Modulo Theories (SMT)** solvers can be applied to real-world agricultural problems. By converting a static dataset (CSV) into a logical knowledge base, the system can:
1.  **Diagnose** problems based on observed symptoms.
2.  **Prescribe** treatments based on logical relationships.
3.  **Verify** the consistency of the knowledge base.

**Technologies Used:**
* **Python 3.x**: Core programming language.
* **Streamlit**: Web-based user interface.
* **Z3-Solver (Microsoft Research)**: The reasoning and inference engine.

---

## Key Features

### 1. Symptom Checker (Diagnostic Mode)
Users select a visible symptom (e.g., "Holes in nuts"). The system uses **Reverse Inference** to:
* Identify the underlying Disease or Pest.
* Deduce the appropriate Treatment based on the disease relationship.

### 2. Disease Encyclopedia (Lookup Mode)
Users can search for a specific pathogen (e.g., "Anthracnose"). The system uses **Forward Verification** to retrieve all mathematically linked facts (symptoms and cures) for that entity.

### 3. Auto-Generated Logic Proof
Upon execution, the system automatically generates a file named `macadamia_facts.z3`. This file contains the raw logical assertions in **SMT-LIB** format, serving as proof of the internal logic representation.

---

## Installation & Setup

### Prerequisites
Ensure you have **Python 3.8+** installed.

### 1. Clone or Download the Project
Unzip the project folder containing `app.py` and `macadamia.csv`.

### 2. Install Dependencies
Open your terminal/command prompt in the project folder and run:

```bash
pip install streamlit z3-solver
```

---

## How to Run

1.  Navigate to the project directory in your terminal.
2.  Run the Streamlit application:

<!-- end list -->

```bash
streamlit run app.py
```

3.  A browser window will open automatically (usually at `http://localhost:8501`).
4.  **Note:** Check your project folder after running the app. You will see a new file `macadamia_facts.z3` generated automatically.

---

## System Architecture

This system uses the **Z3 Fixedpoint Engine** (Datalog) to perform reasoning. Here is the technical breakdown of the logic:

### 1\. The Z3 Logic Engine

  * **Data Representation:** Z3 operates on mathematical objects. We define a custom Sort `Thing = BitVecSort(32)`.
  * **Mapping:** Every Disease, Symptom, and Treatment is assigned a unique 32-bit integer ID.
  * **Relations:** We define mathematical functions to represent relationships:
      * `has_symptom(DiseaseID, SymptomID) -> Bool`
      * `treated_with(TreatmentID, DiseaseID) -> Bool`

### 2\. Logical Inference Rules

The system does not have a simple "Symptom-to-Cure" database table. Instead, it uses a **Horn Clause** (Logic Rule) to infer the cure dynamically.

**The Logic Rule (Python/Z3 Syntax):**

```python
fp.rule(cures_symptom(t, s), [treated_with(t, d), has_symptom(d, s)])
```

**The Logical Proof:**

> A Treatment (**t**) is a cure for a Symptom (**s**) **IF AND ONLY IF**:
>
> 1.  The Treatment (**t**) treats a specific Disease (**d**)
> 2.  **AND** that Disease (**d**) is the cause of the Symptom (**s**).

This allows the system to "bridge the gap" between symptoms and treatments without explicit hard-coding.

---