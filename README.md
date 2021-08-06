# learn-terraform-spotify

Create a playlist on Spotify by writing it as a Terraform configuration.

Follow along with the tutorial at [learn.hashicorp.com](https://learn.hashicorp.com/tutorials/terraform/spotify-playlist).

# Start docker authorization-proxy

- run:  
`docker run --rm -it -p 27228:27228 --env-file ./env.properties ghcr.io/conradludgate/spotify-auth-proxy`
- copy the uri and open it in a browser
- accept
