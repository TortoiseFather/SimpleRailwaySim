from sklearn.model_selection import train_test_split
from numpy import loadtxt
from sklearn.naive_bayes import GaussianNB
from numpy import loadtxt
import numpy as np
from keras.models import Sequential
from keras.layers import Dense
from keras.optimizers import SGD


def createModel():
    # load the dataset
    dataset = loadtxt('PedestrianSanitised.csv', delimiter=',')
    # split into input (X) and output (y) variables
    X = dataset[:,0:9]
    y = dataset[:,9:11]
    # define the keras model
    model = Sequential()
    model.add(Dense(10, input_dim=9, activation='relu'))
    model.add(Dense(8, activation='relu'))
    model.add(Dense(10, activation='relu'))
    model.add(Dense(2, activation='sigmoid'))
    # compile the keras model
    opt = SGD(lr=0.01, momentum=0.9)
    model.compile(loss='binary_crossentropy', optimizer=opt, metrics=['accuracy'])
    # fit the keras model on the dataset
    model.fit(X, y, epochs=150, batch_size=10, verbose=0)
    # evaluate the keras model
    _, accuracy = model.evaluate(X, y, verbose=0)
    print('ReLu model, Accuracy: %.2f' % (accuracy*100))
    return model
Rel = createModel()