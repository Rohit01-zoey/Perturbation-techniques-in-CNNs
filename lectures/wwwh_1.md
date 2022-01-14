# 3 W's and an H
In this post, I wanted to go through *when*, *what*, *why* and *how* did perturbation techniques actually come about.

---
Before that let's recall back propagation. 
## Back Propagation - A quick recap
![](https://thumbs.gfycat.com/AdolescentIdioticGoldeneye-size_restricted.gif)
So, the main aim in back-propagation is to found out the **gradient** of the loss function with respect to the weights of the neurons in our CNN architecture. Having found out this we can then perform gradient descent and try to find out the new updated weights.
$$ \Delta w_i = -\eta \frac{\partial L}{\partial w_i}$$
where L is the loss function and w_i is the weight of the neuron.

So as the depth of our neural network increases at each level of the network we need to perform the above update. And so its clear why this requires such precise calculation power since this techique is susceptible to error propagation.

---
## The Underlying principle - *Minimal Disturbance Principle*