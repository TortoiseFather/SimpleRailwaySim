
from sklearn.model_selection import train_test_split
from numpy import loadtxt
from sklearn.naive_bayes import GaussianNB
from numpy import loadtxt
import numpy as np
from keras.models import Sequential
from keras.layers import Dense
from keras.optimizers import SGD

def ReturnNB():
    dataset = loadtxt('PedestrianSanitised.csv', delimiter=',');
    X = dataset[:, 0:8]
    y = dataset[:, 9]
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.4, random_state=0)
    # Do a baysean
    gnb = GaussianNB()
    y_pred = gnb.fit(X_train, y_train).predict(X_test)
    print("Gaussian NB: Number of correctly labeled points out of a total %d points : %d"
          % (X_test.shape[0], (y_test != y_pred).sum()))
    return gnb

Bayes = ReturnNB()