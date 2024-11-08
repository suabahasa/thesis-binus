from transformers import AutoModelForSeq2SeqLM
from .tokenizer import IndoNLGTokenizer


def get_model():
    return AutoModelForSeq2SeqLM.from_pretrained("indobenchmark/indobart-v2")


def get_tokenizer():
    return IndoNLGTokenizer.from_pretrained("indobenchmark/indobart-v2")
