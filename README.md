# Deep RL Quadcopter Controller

The agent implemented follows the approach in [1] and consists of a Policy-Based Actor-Critic algorithm called Deep Deterministic Policy Dradients (DDPG). In actor-critics two oposite components denominated as actor and critic improve mutually from the other's output, the former learns how to perform actions in a given environment trying to maximize reward based on the evaluation made by the critic and the later uses predictions made by the actor and rewards of such actions in order to enhance evaluation in further iterations.

In DDPG the components previously mentioned are neuronal networks. The actor's first and final layers has as many nodes as parameters describing the state and action spaces respectivelly, and three hidden full connected layers with Relu activations. The critic maps state-action pairs to a Q-value matrix, it has two input layers with as many nodes as parameters describing the state an action spaces respectivelly, wich are preceded by two full connected Relu activated layers and added up before connecting with a final full conected for the Q-value.

  [1] Lillicrap, Timothy P., et al. "Continuous control with deep reinforcement learning." arXiv preprint arXiv:1509.02971 (2015).

## Project Instructions

1. Clone the repository and navigate to the downloaded folder.

```
git clone https://github.com/roj4s/quadcop_rl.git
cd quadcop_rl
```

2. Build docker image.

```
docker build -t roj4s/quadcop .
```

3. Run docker image.
```
docker run --gpus all -p 8080:8080 roj4s/quadcop

```

4. Open the notebook in any browser at http://localhost:8080.
