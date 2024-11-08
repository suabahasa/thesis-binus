from datasets import load_dataset
import pandas as pd


class IndoSum:
    def __init__(self):
        self.ds = load_dataset("joshuasiagian/indosum")

    def ds(self):
        """
        Return the dataset.
        """
        return self.ds

    def to_pd(self, type="train"):
        """
        Convert the dataset to a pandas DataFrame.

        Args:
            type (str): The split to convert to a DataFrame. Options are "train", "validation", and "test".
        """
        return pd.DataFrame(self.ds[type])

