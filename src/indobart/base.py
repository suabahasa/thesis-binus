from transformers import AutoModelForSeq2SeqLM, BartConfig, AutoConfig
from .tokenizer import IndoNLGTokenizer

def get_model():
    return AutoModelForSeq2SeqLM.from_pretrained("indobenchmark/indobart-v2")


def get_tokenizer():
    return IndoNLGTokenizer.from_pretrained("indobenchmark/indobart-v2")

def get_config():
    # return AutoConfig.from_pretrained("indobenchmark/indobart-v2")
    return BartConfig.from_pretrained("indobenchmark/indobart-v2")