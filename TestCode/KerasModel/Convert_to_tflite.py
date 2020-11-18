import tensorflow as tf
import numpy as np
import Model
from PIL import Image
from tensorflow.keras.models import Model


def get_layer_index(model, layer_name):
    for i, l in enumerate(model.layers):
        if l.name == layer_name:
            return i
    return None


try:
    MODEL_FILE = "Model.h5"
    MODEL_TFLITE = "Model.tflite"
    TEST_IMG = "Img/Test_img.png"

    with tf.device('/cpu:0'):
        # Load model
        print("\n\nLoad Model...\n")
        model = tf.keras.models.load_model(MODEL_FILE)
        output_index = []
        for n in ['throttle', 'steer']:
            i = get_layer_index(model, n)
            if i is not None:
                print(i)
                output_index.append(i)
        # model.summary()
        model_new = Model(model.input, [model.layers[x].output for x in output_index])
        model_new.summary()
        print("\nDone")

        converter = tf.lite.TFLiteConverter.from_keras_model(model_new)
        converter.target_ops = [tf.lite.OpsSet.TFLITE_BUILTINS,
                                tf.lite.OpsSet.SELECT_TF_OPS]
        tfmodel = converter.convert()
        with open(MODEL_TFLITE, "wb") as m:
            m.write(tfmodel)

        # interpreter = tf.lite.Interpreter(model_path=MODEL_TFLITE)
        # interpreter.allocate_tensors()

        # Get input and output tensors.
        # input_details = interpreter.get_input_details()
        # output_details = interpreter.get_output_details()

        # Test model on random input data.
        # input_shape = input_details[0]['shape']
        # test_img = Image.open(TEST_IMG)
        # test_data = np.array(test_img, dtype=np.float32)
        # test_data_shape = test_data.shape
        # test_data /= 255.0
        # test_data = test_data.reshape(input_shape)
        # interpreter.set_tensor(input_details[0]['index'], test_data)

        # interpreter.invoke()

        # The function `get_tensor()` returns a copy of the tensor data.
        # Use `tensor()` in order to get a pointer to the tensor.
        # output_data = interpreter.get_tensor(output_details[0]['index'])
        # output_data *= 255
        # print(output_data.shape, output_data.dtype)
        # output_data = output_data.reshape(test_data_shape)
        # output_img = Image.fromarray(output_data.astype(np.uint8))
        # output_img.save("Img/Prediction_img_tflite.png")

except:
    import traceback
    traceback.print_exc()

else:
    input(">>")