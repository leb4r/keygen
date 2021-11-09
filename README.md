# Keygen

Generate keys, addresses, and certificates on blockchain networks.

## Usage

### Software Requirements

This project requires the following to be present for execution:

- Docker
- Make

### Make Targets

Execution is facilitated via `make`. Execute the `help` target to get a list of options.

```text
❯ make help
Available targets:

  artifacts                           Create artifacts directory
  cardano/addr                        Generate an address that can send and receive payments
  cardano/cold                        Generate a cold key pair and counter
  cardano/kes                         Generate a KES key pair
  cardano/kes/cert                    Generate operating certificate
  cardano/pool/cert                   Generate a staking registration certificate
  cardano/staking/addr                Generate a staking address, which requires a key pair
  cardano/staking/metadata            Generate staking pool metadata JSON
  cardano/vrf                         Generate a VRF key pair
  help                                Help screen
  help/all                            Display help for all targets
  help/short                          This help short screen
```

### Examples

#### Cardano Address

```bash
git clone https://github.com/leb4r/keygen.git
cd keygen/
make cardano/addr
```

#### Cardano Staking Pool

TBD
