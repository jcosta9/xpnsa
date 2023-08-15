# Explainability for Property Violations in Cyber-Physical Systems: An Immune-Inspired Approach
[![GitHub license](https://img.shields.io/github/license/jcosta9/xpnsa)](https://github.com/jcosta9/xpnsa/blob/main/LICENSE)

This repository contains the implementation and resources for the research paper titled "Explainability for Property Violations in Cyber-Physical Systems: An Immune-Inspired Approach." The paper addresses the challenge of identifying and explaining anomalies in complex relations within cyber-physical systems (CPS) by leveraging the immune-inspired Negative Selection Algorithm.

## Abstract

Complex relations between cybernetic and physical components of a cyber-physical system (CPS) in tandem with continuous environment changes represent a challenge to engineering robust CPSs. To help engineers determine the cause of violations, there is a need for a systematic approach that provides explanations for anomalies that may arise in those CPS complex relations. Such an explanation needs to represent the understanding of the system behaviors that lead to critical failures of the CPS. In this work, we present a methodology that leverages the explainability provided by the immune-inspired Negative Selection Algorithm to find patterns for faulty behavior in CPSs. The approach identifies and isolates crucial anomalous behaviors that can not only hamper the system but also are often challenging to capture while engineering a CPS.

## Features

- Codebase for generating synthetic patient profile data
- Modelica models for a Body Sensor Network (BSN)
- Codebase for running experiments programatically in Modelica
- Implementation of the Negative Selection Algorithm for anomaly detection in CPS.
- Jupyter Notebook for reproducing the experiments and results mentioned in the paper.

## Project Structure

The repository is organized as follows:

- `data/`: Includes sample and synthetic data that can be used in the experiments. New files can be created using the scripts inside the `/src` folder.
- `files/`: Folder containing configuration and other information files
    - `config/`: Configuration files stored in yaml format
        - `markov/`: Markov chains for patient profile generation
        - `config.yaml`: General configurations file
        - `data_process.yaml`: Config file for processing data
        - `final_features_temperature.yaml`: Set of features selected for the final analysis
        - `ome_simulation_config.yaml`: Configuration file for running the BSN experiments using the OpenModelica API
- `models/`: BSN Modelica models used to reproduce the experiments.
- `src/`: Contains the source code for the project.
    - `config/`: Module responsible for reading config files
    - `experiment/`: Utility functions and classes for the patient profile generation
    - `negativeSelection/`: Several implementations of the Negative Selection Algorithm and utility functions
    - `OpenModelica/`: Module responsible for handling OpenModelica API operations
    - `preprocessing/`: Module for processing data for the analysis
    - `1. app_create_experiment_markov.py`: Script that generates patient profiles using the Markov Chains stored in `files/config/markov`
    - `2. data_pipeline.py`: Script responsible for: (i) running the OpenModelica simulations using the generated patient profiles, (ii) processing the resulting data in order to create the features that will be further analyzed.
    - `3. Temperature_sanity_check.ipynb`: Script that verifies if the features were generated correctly
    - `4. temperature_eda.ipynb`: Analysis of the generated features for ranking and selection of the most relevant
    - `5. Negative Selection.ipynb`: Execution of the Negative Selection Algorithm to create the nonself detectors 
    - `6. temperature_ns_result.ipynb`: Analysis of the generated detectors to leverage the explainability of the algorithm

## Getting Started

### Prerequisites

- Python 3.x
- Required Python packages can be installed using `pip`:

```bash
pip install -r requirements.txt
```

### Installation

1. Clone this repository:

```bash
git clone https://github.com/jcosta9/xpnsa.git
```

2. Change to the repository directory:

```bash
cd xpnsa
```

### Usage
The files inside the src/ folder are numbered according to the order in which they must be run.
1. The patient profiles are generated using markov chains. 
    - These chains were developed in the [markov-sensors](https://github.com/rdinizcal/markov-sensors) project, where the author clustered data from real patients based on their health risk probability as [high_risk_0, medium_risk_0, low_risk, medium_risk_1, high_risk_1]. More information can be found in his repository.
    - The algorithm randomly selects a risk class and generates random numbers to evaluate the next state.
    - After the new state is selected, a value whithin that state is randomly picked.
    - this process is executed according to the sample_size variable and stored in a csv file
    - The number of patient profiles is defined by the varible how_many
2. The data_pipeline.py is responsible for two main activities
    1. Read the patient profiles, attach them to instances of the BSN in OpenModelica and run the simulation changing a few parameters
    2. Extract the resulting data, and generate the features based on the executions.
3. The dataset is sanitized
4. The resulting dataset is analyzed in relation to the property at hand. 
    - Features are ranked based on the number of property violations
    - Features with low correlations are discarded.
    - The resulting set of features is stored in the `files/config/final_features_temperature.yaml` file.
5. The negative selection is executed and the model is stored.
6. The generated detectors are analyzed and clustered, and their explainability is derived.



## License
This project is licensed under the MIT License - see the LICENSE file for details.

## Acknowledgments
This project was developed as part of the research described in the paper "Explainability for Property Violations in Cyber-Physical Systems: An Immune-Inspired Approach." This work has been financially supported by CAPES, Alexander von Humboldt Foundation, and the Wallenberg AI, Autonomous Systems and Software Program (WASP) funded by the Knut and Alice Wallenberg Foundation. The authors also acknowledge the support of the PNRR MUR project VITALITY (ECS00000041), Spoke 2 ASTRA - Advanced Space Technologies and Research Alliance, PNRR MUR project CHANGES, and of the MUR (Italy) Department of Excellence 2023 - 2027 for GSSI.

## Contact
For any questions or inquiries, please contact Joao Paulo Costa de Araujo at jp.araujo@hu-berlin.de.