"""
This model is based on "KerasLiner" from Donkey Car Project.
Please Refer to https://github.com/autorope/donkeycar/blob/dev/donkeycar/parts/keras.py
https://hajimerobot.co.jp/wp/wp-content/uploads/2018/11/model.png

(120, 160, 3) -> (58, 78, 24) -> (27, 37, 32) -> (12, 17, 64) -> (5, 8, 64) -> (3, 6, 64) -> (1152,) ->  (100,) ->  (50,) -> (1,), (1,)

"""


import numpy as np

import tensorflow as tf
from tensorflow import keras
from tensorflow.keras.models import Model, Input
from tensorflow.keras.layers import Dense
from tensorflow.keras.layers import Conv2D, DepthwiseConv2D, MaxPooling2D, Conv2DTranspose
from tensorflow.keras.layers import UpSampling2D, Activation, Concatenate, BatchNormalization, Reshape, Flatten
from tensorflow.keras.layers import LeakyReLU, Add, PReLU, Dropout, SpatialDropout2D, ZeroPadding2D, Softmax, ReLU


def Linear(img_in, num_outputs, input_shape=(120, 160, 3), drop=0.2, l4_stride=1):
    """
    :param img_in:          input layer of network
    :param drop:            dropout rate
    :param l4_stride:       4-th layer stride, default 1
    """
    inputs = Input(shape=input_shape, name='img_in')
    x = conv2d_relu(inputs, 24, 5, 2, 1)
    x = Dropout(drop)(x)
    x = conv2d_relu(x, 32, 5, 2, 2)
    x = Dropout(drop)(x)
    x = conv2d_relu(x, 64, 5, 2, 3)
    x = Dropout(drop)(x)
    x = conv2d_relu(x, 64, 3, l4_stride, 4)
    x = Dropout(drop)(x)
    x = conv2d_relu(x, 64, 3, 1, 5)
    x = Dropout(drop)(x)
    x = Flatten(name='flattened')(x)

    x = Dense(100, activation='relu', name='dense_1')(x)
    x = Dropout(drop)(x)
    x = Dense(50, activation='relu', name='dense_2')(x)
    x = Dropout(drop)(x)

    outputs = []
    for i in range(num_outputs):
        _x = Dense(1, activation='linear', name='n_outputs' + str(i))(x)
        _x = Softmax()(x)
        outputs.append(_x)

    model = Model(inputs=[img_in], outputs=outputs)
    return model


def conv2d_relu(x, filters, kernel, strides, layer_num):
    """
    Helper function to create a standard valid-padded convolutional layer
    with square kernel and strides and unified naming convention
    :param filters:     channel dimension of the layer
    :param kernel:      creates (kernel, kernel) kernel matrix dimension
    :param strides:     creates (strides, strides) stride
    :param layer_num:   used in labelling the layer
    """
    x = Conv2D(filters=filters,
               kernel_size=(kernel, kernel),
               strides=(strides, strides),
               name='conv2d_' + str(layer_num))(x)
    x = ReLU(x)

    return x
