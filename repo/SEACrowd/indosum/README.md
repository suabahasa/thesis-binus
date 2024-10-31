
---
language: 
- ind
pretty_name: Indosum
task_categories: 
- summarization
tags: 
- summarization
---

INDOSUM is a new benchmark dataset for Indonesian text summarization. 
The dataset consists of news articles and manually constructed summaries.


## Languages

ind

## Supported Tasks

Summarization

## Dataset Usage
### Using `datasets` library
```
from datasets import load_dataset
dset = datasets.load_dataset("SEACrowd/indosum", trust_remote_code=True)
```
### Using `seacrowd` library
```import seacrowd as sc
# Load the dataset using the default config
dset = sc.load_dataset("indosum", schema="seacrowd")
# Check all available subsets (config names) of the dataset
print(sc.available_config_names("indosum"))
# Load the dataset using a specific config
dset = sc.load_dataset_by_config_name(config_name="<config_name>")
```

More details on how to load the `seacrowd` library can be found [here](https://github.com/SEACrowd/seacrowd-datahub?tab=readme-ov-file#how-to-use).


## Dataset Homepage

[https://github.com/kata-ai/indosum](https://github.com/kata-ai/indosum)

## Dataset Version

Source: 1.0.0. SEACrowd: 2024.06.20.

## Dataset License

Apache License, Version 2.0

## Citation

If you are using the **Indosum** dataloader in your work, please cite the following:
```
@INPROCEEDINGS{8629109,
  author={Kurniawan, Kemal and Louvan, Samuel},
  booktitle={2018 International Conference on Asian Language Processing (IALP)}, 
  title={Indosum: A New Benchmark Dataset for Indonesian Text Summarization}, 
  year={2018},
  volume={},
  number={},
  pages={215-220},
  doi={10.1109/IALP.2018.8629109}}


@article{lovenia2024seacrowd,
    title={SEACrowd: A Multilingual Multimodal Data Hub and Benchmark Suite for Southeast Asian Languages}, 
    author={Holy Lovenia and Rahmad Mahendra and Salsabil Maulana Akbar and Lester James V. Miranda and Jennifer Santoso and Elyanah Aco and Akhdan Fadhilah and Jonibek Mansurov and Joseph Marvin Imperial and Onno P. Kampman and Joel Ruben Antony Moniz and Muhammad Ravi Shulthan Habibi and Frederikus Hudi and Railey Montalan and Ryan Ignatius and Joanito Agili Lopo and William Nixon and Börje F. Karlsson and James Jaya and Ryandito Diandaru and Yuze Gao and Patrick Amadeus and Bin Wang and Jan Christian Blaise Cruz and Chenxi Whitehouse and Ivan Halim Parmonangan and Maria Khelli and Wenyu Zhang and Lucky Susanto and Reynard Adha Ryanda and Sonny Lazuardi Hermawan and Dan John Velasco and Muhammad Dehan Al Kautsar and Willy Fitra Hendria and Yasmin Moslem and Noah Flynn and Muhammad Farid Adilazuarda and Haochen Li and Johanes Lee and R. Damanhuri and Shuo Sun and Muhammad Reza Qorib and Amirbek Djanibekov and Wei Qi Leong and Quyet V. Do and Niklas Muennighoff and Tanrada Pansuwan and Ilham Firdausi Putra and Yan Xu and Ngee Chia Tai and Ayu Purwarianti and Sebastian Ruder and William Tjhi and Peerat Limkonchotiwat and Alham Fikri Aji and Sedrick Keh and Genta Indra Winata and Ruochen Zhang and Fajri Koto and Zheng-Xin Yong and Samuel Cahyawijaya},
    year={2024},
    eprint={2406.10118},
    journal={arXiv preprint arXiv: 2406.10118}
}

```