# 3 W's and an H
- [3 W's and an H](#3-ws-and-an-h)
  - [- Comments](#--comments)
  - [General architecture](#general-architecture)
    - [Notation](#notation)
  - [Back Propagation - A quick recap](#back-propagation---a-quick-recap)
  - [Weight perturbation](#weight-perturbation)
    - [WP Algo at a very simplistic level](#wp-algo-at-a-very-simplistic-level)
  - [Node Perturbation](#node-perturbation)
  - [Hardware Implementation BP](#hardware-implementation-bp)
    - [Notation used](#notation-used)
    - [Flow of information](#flow-of-information)
  - [Hardware Implementation WP](#hardware-implementation-wp)
  - [Hardware Implementation NP](#hardware-implementation-np)
  - [Who wins?](#who-wins)
  - [Comments](#comments)
---
## General architecture
![](https://miro.medium.com/proxy/1*YuotNxDwryjp3FiOwhVIkg.jpeg)





![general_arch](/images/general_arch.png)

### Notation
$H$ -  depth of the neural network

$n_i$ - number of nodes in the $i^{th}$ layer(depth i),  $1 \leq i \leq H$

$W_i$ - weight vector of the  $i^{th}$ layer(depth i),  $1 \leq i \leq H$ i.e connects the $(i-1)^{th}$ layer to the $i^{th}$ layer

$w_{k, ij}$ - weight of the $k^{th}$ layer(depth k) connecting the $i^{th}$ node of the $(k-1)^{th}$ layer to the $j^{th}$ node of the $k^{th}$ layer 

$z^{(k)}_{j}$ - value of the $j^{th}$ node before activation function at depth k of the neural network.

$z^{(k)}$ - $\{z^{(k)}_{j}| \forall j, 1 \leq j \leq n_j\}$

$x_{k, j}$ - value of the $j^{th}$ neuron after activation function at depth k of the neural network.

$x_k$ - $\{ x_{k, j}| \forall j, 1 \leq j \leq n_j\}$, $0 \leq k \leq H$

$x_0$ - the input

$y$ - training outuput

$x_H$ - model output

---
## Back Propagation - A quick recap
![](https://thumbs.gfycat.com/AdolescentIdioticGoldeneye-size_restricted.gif)


So, the main aim in back-propagation is to found out the **gradient** of the loss function with respect to the weights of the neurons in our CNN architecture. Having found out this we can then perform gradient descent and try to find out the new updated weights.
$$ \Delta w_i = -\eta \frac{\partial L}{\partial w_i}$$
where L is the loss function and $w_i$ is the weight of the neuron.

Using chain rule again and again we get the following,

![general_arch](/images/back_prop_algo.png )

So as the depth of our neural network increases at each level of the network we need to perform the above update. And so its clear why this requires such precise calculation power since this techique is susceptible to error propagation.

![](https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS4_xtx_XOVvoRdHq4BSK3N8FXVScr9s9RlAA&usqp=CAU)



---
## Weight perturbation

![](../images/wp_algo.png)

In Weight perturbation, we approximate the gradient as,

$$ \frac{\partial L}{\partial w_{k, ij}} \approx \frac{\Delta L}{\Delta w_{k, ij}} = \frac{L(w_{k, ij} + pert_{k, ij}) - L(w_{k, ij})}{pert_{k, ij}}$$

Thus, the update rule becomes,

$$ \Delta w_{k, ij} = - \eta \times \frac{\Delta L}{\Delta w_{k, ij}}$$
$$ \implies \Delta w_{k, ij}  = - \eta \times \left (\frac{L(w_{k, ij} + pert_{k, ij}) - L(w_{k, ij})}{pert_{k, ij}} \right) $$

We can rewrite the above equation as follows,
$$ \Delta w_{k, ij} = G(pert_{k, ij})\Delta L(w_{k, ij}, pert_{k, ij})$$

>Notice that we only need to perform forward passes in this method - no back propagation is required. This is good news in terms of hardware since now we need only unidirectional circuit as compared to bi-directional cicuitry required in the case of back propagation.

### WP Algo at a very simplistic level
```python
for each pattern p {
    E = ForwardPass()
    ClearDeltaWeights()
    for each weight w_k_ij do {
        Epert = ApplyPerturbation(w_k_ij)
        DeltaError = Epert - E
        DeltaW[k][i] = - eta * DeltaError/Perturbation
        RemovePerturbation(w_k_ij)
    }
}
```
---

## Node Perturbation

![](../images/np_algo.png)

>Correction in this formula, see the next formula !!

Here, we want to approximate the gradient of the node output with respect to the loss function. Thus,
$$ \frac{\partial L}{\partial w_{k, ij}} \approx \frac{\Delta L}{\Delta z_{k,j}} \times x_{k-1, i}$$

Thus, the update rule becomes,
$$ \Delta w_{k, ij} = - \eta \times \frac{\Delta L}{\Delta z_{k,j}} \times x_{k-1, i}$$
$$ \implies \Delta w_{k, ij}  = - \eta \times \left (\frac{L(z_{k,j} + pert_{k, ij}) - L(z_{k,j})}{pert_{k, ij}} \right)\times x_{k-1, i} $$

We can rewrite the above equation as follows,
$$ \Delta w_{k, ij} = G(pert_{k, ij}) \times \Delta L(z_{k,j}, pert_{k, ij}) \times x_{k-1, i}$$

>> Althought the algorithm remains more or less the same, we need to perform an additonal multipication in the case of NP and thus this requires additional hardware. Thus, WP is slightly better with respect to this!

---

## Hardware Implementation BP
![](../images/bp.jpg)
Notice that this diagram shows the flow of information from a neuron j to neuron i.

### Notation used
1. $net_j$ : net input to a neuron j
2. $x_j$ : output of a neuron j

### Flow of information
Recall that we had written the formula
$\frac{\partial L}{\partial w_{k, ij}}$.

## Hardware Implementation WP
![](../images/wp.jpg)

## Hardware Implementation NP
![](../images/np.jpg)


## Who wins?

![](../images/comp.jpg)

## Comments

1. Matrix mult highly accelerated...easy to do BP ?
2. Memory used to rep the weight-SRAM affects the area of the chip- bits/weight
3. Is it pocble to do BP on chip? - does it work with less no of bits?
4. Sufficient precision reqd in BP
5. Deep network with limited no of bits/weight adn the no of layers.
6. Highlight the difference...expt to support hypothesis - absence of BP affects in terms of 
7. Winning - performance, area or speed ?
8. Performance - less bpw more layers- WP wins
9. Variablity - analog based charac  - BP - formula based 

