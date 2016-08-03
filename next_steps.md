Next Steps
==========
#### Automate builds
- dockerfiles supplied
- packer.json supplied

#### Improve/Automate SSH key support
- We presently use (and include in repo!) a dummy rsa key.
- We try ~/.ssh and auto-create if necessary.

#### Improve Speed
- We could bake docker image into AMI instead of pulling it during cloud init.

#### Improve Security
- Current images and dependencies all pinned, so we need to automate patches.
- Does the application need arbitrary internet access?
    - It has it now, but we could limit it to required URL(s)

#### Automate Testing
- To begin a proper CD pipeline, we need to wrap tests around all this.
- We should choose a tool: (
[CircleCI](http://CircleCI.Com) /
[CodeShip](https://CodeShip.com) /
[Jenkins](https://Jenkins.IO) /
[Travis](https://Travis-CI.Org) / etc.)
- We should then confirm that each of these remain responsive and visible in logs
    - host server
    - container
    - service
    - application
- We should [inhibit regression errors](https://help.github.com/articles/about-protected-branches/).

#### Extend the service and environment patterns to support
- auto-scaling groups
- multiple availability zones
- multiple regions

#### Integrate DNS
- We should accept a domain variable and then create/update \<env\>.my_domain entries.

#### Integrate Logging
- Consider [logspout](https://hub.docker.com/r/gliderlabs/logspout/).
- Radiate (per service)
    - requests per interval
    - request types (if applicable)
        - count per interval
        - min & med & max response times
    - server/container count
    - avg cpu & mem util % per interval
- Notify when
    - URL not responsive
    - Logs stop unexpectedly
    - server count oustide expected range
    - external provider health check fails

#### Integrate [Consul](https://www.consul.io/)
- Currently, our locally stored tfstate effectively precludes multiple deployers

#### Privatize [docker registry](https://github.com/docker/distribution)
- docker images currently public
- to avoid $ and stay libre,
we should [privatize](https://github.com/Capgemini/terraform-amazon-ecs) them
