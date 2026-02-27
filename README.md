# Hybrid Gödel-Fitch Approach via Scope-Constrained Reinforcement Learning

[![ArXiv](https://img.shields.io/badge/arXiv-2602.XXXXX-b31b1b.svg)](https://arxiv.org/)
[![Python 3.11+](https://img.shields.io/badge/python-3.11+-blue.svg)](https://www.python.org/downloads/)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

**Authors**: Jonggeon Moon (문종건), Jiho Han (한지호)  
**Affiliation**: Korea Science Academy of KAIST  
**Contact**: 25-041@ksa.hs.kr, 25-122@ksa.hs.kr

> **Abstract:** This repository contains the official implementation of the paper *"Hybrid Gödel-Fitch Approach via Scope-Constrained Reinforcement Learning"*. We introduce a novel neuro-symbolic framework for automated theorem proving in Peano Arithmetic. By combining Fitch-style natural deduction with Prime-Factor Embeddings (PFE), we constrain the Reinforcement Learning (RL) agent's action space to strictly valid logical scopes. Final proofs are verified using Rocq (Coq) as a formal oracle.



---

## 🔬 Research Overview

Automated Theorem Proving (ATP) often suffers from state-space explosion, especially in inductive domains like Peano Arithmetic. Traditional RL agents struggle to maintain logical consistency across deep proof trees. 

Our research solves this by enforcing **Structural Scoping**:
1. **Fitch-Style Core**: The environment natively tracks Active Assumptions, preventing the agent from referencing closed subproofs (Scope Leaking).
2. **Prime-Factor Embedding (PFE)**: Formulas are arithmetized into dense vectors using Gödel-inspired prime indexing, preserving the exact topological structure of the logic without massive sequence lengths.
3. **Oracle Verification**: The agent's generated Fitch proofs are deterministically compiled into Gallina scripts and verified by Rocq, providing sparse but absolute reward signals.

---

## 🚀 Research Progress & Roadmap

We are actively developing and testing the framework. You can track our current progress below:

- [x] **Phase 1: Symbolic Core Construction**
  - Implement Fitch scope manager and accessibility masking.
  - Build dynamic vocabulary parser (Objects, Functions, Variables).
- [x] **Phase 2: PFE Vectorization**
  - Implement Gödel-numbered Prime-Factor Embedding for Peano axioms.
  - Validate reversible decoding algorithms.
- [ ] **Phase 3: RL Agent & Environment**
  - Wrap the core in a Gymnasium environment.
  - Train baseline PPO agent on propositional logic (Stage 1 Curriculum).
- [ ] **Phase 4: Rocq Integration**
  - Build `fitch_to_rocq` translator.
  - Establish automated reward pipeline via Ltac/Gallina.

---

## 📂 Repository Architecture

### 1. Source Code (`src/`)
The core engine where symbolic logic operations and neural networks converge.
* `core/`: The heart of the pure logic system (`fitch_system.py`, `vocabulary.py`, `pfe_encoder.py`).
* `rules/`: Modularized inference rules, including safe substitution logic for Universal Elimination.
* `env/`: The training ground for the RL agent (`fitch_gym.py`).
* `parsers/`: Translators between our Fitch core and Rocq (`rocq_to_fitch.py`, `fitch_to_rocq.py`).
* `rl/`: The brain of the agent, handling NSG (Nested Scope Graph) processing.

### 2. Research & Reproducibility
* `baselines/`: Comparison models (Vanilla PPO, Z3) to demonstrate the superiority of the hybrid system.
* `configs/`: YAML files locking in all hyperparameters (learning rates, reward weights, MPS allocation).
* `scripts/`: Automation scripts for training, data generation, and ablation studies.
* `paper/`: Manuscript drafting directory. Visualizations are automatically saved to `figures/`.

### 3. Data & Testing
* `data/`: Local storage for training tensors and `.pth` weights (ignored in Git).
* `tests/`: Unit tests catching critical bugs like closed-scope referencing or PFE decoding failures.
* `notebooks/`: Interactive Jupyter demos for reviewers.

---

## 🛠️ Quick Start

You can control the entire research pipeline with simple `make` commands. MPS acceleration is automatically enabled on ARM architecture environments.

```bash
# Clone the repository
git clone [https://github.com/yourusername/godel_fitch_rl.git](https://github.com/yourusername/godel_fitch_rl.git)
cd godel_fitch_rl

# Install dependencies
pip install -r requirements.txt

# Run the full pipeline (Train -> Plot -> Compile Paper)
make all