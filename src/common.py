import os
import torch


def get_device():
    """
    Initiate and return the device to be used by PyTorch.
    """
    device = torch.device("cpu")

    if torch.cuda.is_available():
        device = torch.device("cuda")
        print("using cuda")
    elif torch.backends.mps.is_available():
        device = torch.device("mps")
        os.environ["PYTORCH_MPS_HIGH_WATERMARK_RATIO"] = (
            "1"  # This is tracked as pytorch issue #98222
        )
        print("using mps")
    else:
        device = torch.device("cpu")
        print("using cpu")

    return device
