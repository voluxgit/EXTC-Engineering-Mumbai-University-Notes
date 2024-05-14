from sklearn.datasets import load_iris
from sklearn.model_selection import train_test_split

iris = load_iris()
print(iris)

x = iris.data
y = iris.target

x_train, x_test, y_train, y_test = train_test_split(x,y,test_size=0.4,random_state=1)

from sklearn.naive_bayes import GaussianNB
model = GaussianNB()
model.fit(x_train,y_train)

y_pred = model.predict(x_test)


from sklearn import metrics
print(metrics.accuracy_score(y_test,y_pred))

