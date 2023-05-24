function imageDataAugmenter(;
    Pad=[],
    CenterCrop=[],
    Crop=[],
    FiveCrop=[],
    RandomCrop=[],
    Resize=[],
    HorizontalFlip=false,
    RandomHorizontalFlip=[],
    VerticalFlip=false,
    RandomVerticalFlip=[],
    Rescale=[],
    Rotate=[],
    RandomRotation=[],
    Normalize=[],
    HWC2CHW=false,
)
    py"""
    from Image_M import imageDataAugmenter
    """
    py"imageDataAugmenter"(
        Pad,
        CenterCrop,
        Crop,
        FiveCrop,
        RandomCrop,
        Resize,
        HorizontalFlip,
        RandomHorizontalFlip,
        VerticalFlip,
        RandomVerticalFlip,
        Rescale,
        Rotate,
        RandomRotation,
        Normalize,
        HWC2CHW,
    )
end;

function augment(augmenter, I)
    py"""
    from Image_M import augment
    """
    I = convert(Array{UInt8,4}, I)
    return py"augment"(augmenter, I)
end;

function augmentedImageDatastore(outputsize, X, Y, Augmenter; OutputSizeMode="centercrop")
    py"""
    from Image_M import augmentedImageDatastore
    """
    py"augmentedImageDatastore"(outputsize, X, Y, Augmenter, OutputSizeMode)
end;
