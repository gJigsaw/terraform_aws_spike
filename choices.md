### Infrastructure Choices
----------------------
#### Cloud Provider:
- Selected: Amazon AWS
- Declined: DigitalOcean, Rackspace, Heroku, Google Compute Engine
- Reasoning: development speed due to familiarity
#### Idempotent Orchestrator:
- Selected: Terraform
- Declined: CloudFormation
- Reasoning: open-source, provider-agnostic, stateful, CLI-only
#### Amazon AMI Creator:
- Selected: Packer
- Declined: Aminator, AWS CLI, snapshotting
- Reasoning: bundle-agnostic, open-source, simplicity, vendor-consistency
#### Docker Image Builder:
- Selected: Docker
- Declined: Packer
- Reasoning: familiarity
- TODO: evaluate switching to Packer for builder consistency
#### Base OS (AWS & Docker):
- Selected: Ubuntu
- Declined: Alpine
- Reasoning: development speed due to familiarity (don't optimize early)
- TODO: evaluate switching to Alpine for size (download speed)
