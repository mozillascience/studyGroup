'''
From: http://distributed.readthedocs.io/en/latest/joblib.html
'''


import distributed.joblib
# Scikit-learn bundles joblib, so you need to import from
# `sklearn.externals.joblib` instead of `joblib` directly
# This is not true depending on the packaging (e.g. Fedora/Debian)
# in this case, use the following:
# from joblib import parallel_backend
from sklearn.externals.joblib import parallel_backend
from sklearn.datasets import load_digits
from sklearn.grid_search import RandomizedSearchCV
from sklearn.svm import SVC
import numpy as np

#load mnist digits data
digits = load_digits()

#set up the parameters to be explored
param_space = {
    'C': np.logspace(-6, 6, 13),
    'gamma': np.logspace(-8, 8, 17),
    'tol': np.logspace(-4, -1, 4),
    'class_weight': [None, 'balanced'],
}

#create the model
model = SVC(kernel='rbf')
search = RandomizedSearchCV(model, param_space, cv=3, n_iter=50, verbose=10)

#using sklearn's parallel_backend
with parallel_backend('dask.distributed', scheduler_host='localhost:8888'):
    search.fit(digits.data, digits.target)
