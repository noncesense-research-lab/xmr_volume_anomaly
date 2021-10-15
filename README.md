# Code for "Fingerprinting a flood"
For [our report on the mid-2021 Monero transaction volume anomaly](https://mitchellpkt.medium.com/fingerprinting-a-flood-forensic-statistical-analysis-of-the-mid-2021-monero-transaction-volume-a19cbf41ce60) [1], analysis was performed in a Python-language Jupyter Notebook. An R program was also used to create one of the data sets. The source code for these programs is presented in this repository.


# Requirements

## Analysis Notebook
- [Python 3](https://www.python.org) [2]

- Python libraries: see `requirements.txt`.

  Example installation command: `pip install -r requirements.txt`

- [Jupyter Notebook](https://jupyter.org) [3].

- Data sets: download these CSV files of Monero blockchain data into the "`csv`" directory.

  | Data set | Download location |
  | - | - |
  | `tx_attribute_2021.csv` | Available from ["Fingerprinting a flood" data repository](https://github.com/neptuneresearch/fingerprinting-a-flood-data) [4] |
  | `ringmember_height_flood.csv` | Available from ["Fingerprinting a flood" data repository](https://github.com/neptuneresearch/fingerprinting-a-flood-data) [4] |
  | `Noise-reduced-measure-of-youngest-ring-member.csv` | Provided in this repository (see "`csv`" directory)|


## R program: `Noise-reduced-measure-of-youngest-ring-member`

- [R](https://www.r-project.org) [5]

- R libraries:

    - `data.table`
    - `zoo`
    - `ggplot2`

- Data sets: download these CSV files of Monero blockchain data into the "`R`" directory.

    | Data set | Download location |
    | - | - |
    | `block_stat_2021.csv` | Available from ["Fingerprinting a flood" data repository](https://github.com/neptuneresearch/fingerprinting-a-flood-data) [4] |
    | `ringmember_height_flood.csv` | Available from ["Fingerprinting a flood" data repository](https://github.com/neptuneresearch/fingerprinting-a-flood-data) [4] |


# Correspondence

isthmus (at) getmonero (dot) org


# References
[1] Isthmus (Mitchell P. Krawiec-Thayer), Neptune, Rucknium, Jberman, Carrington - Fingerprinting a flood: forensic statistical analysis of the mid-2021 Monero transaction volume anomaly. [https://mitchellpkt.medium.com/fingerprinting-a-flood-forensic-statistical-analysis-of-the-mid-2021-monero-transaction-volume-a19cbf41ce60](https://mitchellpkt.medium.com/fingerprinting-a-flood-forensic-statistical-analysis-of-the-mid-2021-monero-transaction-volume-a19cbf41ce60)

[2] Python. [https://www.python.org](https://www.python.org/)

[3] Project Jupyter. [https://jupyter.org](https://jupyter.org)

[4] GitHub - Neptune Research - Data from "Fingerprinting a flood". [https://github.com/neptuneresearch/fingerprinting-a-flood-data](https://github.com/neptuneresearch/fingerprinting-a-flood-data)

[5] R: The R Project for Statistical Computing. [https://www.r-project.org](https://www.r-project.org)