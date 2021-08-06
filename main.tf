terraform {
  required_providers {
    spotify = {
      version = "~> 0.2.1"
      source = "conradludgate/spotify"
    }
  }
}

variable "spotify_api_key" {
  type = string
  description = "Set this APIKey that the authorization-server outputs in the 'terraform.tfvars' file"
}

provider "spotify" {
  api_key = var.spotify_api_key
  # Public Proxy Configuration:
  # For a simple way to manage your spotify oauth2 tokens is to use https://oauth2.conrad.cafe.
  #auth_server = "https://oauth2.conrad.cafe"
  #username = "your username"
  #token_id = "your token id"
}

resource "spotify_playlist" "playlist" {
  name = "Terraform Summer Playlist"
  description = "My playlist created by Terraform"
  public = true

  tracks = flatten([
    data.spotify_search_track.rem.tracks[0].id,
    data.spotify_search_track.rem.tracks[1].id,
    data.spotify_search_track.rem.tracks[2].id,
    data.spotify_track.kunstfreiheit.id,
    data.spotify_track.eine_gute_nachricht.id,
    data.spotify_search_track.marc_cohn.tracks[0].id,
    data.spotify_search_track.marc_cohn.tracks[1].id,
    data.spotify_search_track.marc_cohn.tracks[2].id,
    data.spotify_search_track.marc_cohn.tracks[3].id,
    data.spotify_search_track.first_aid_kit.tracks[0].id,
    data.spotify_search_track.first_aid_kit.tracks[1].id,
    data.spotify_search_track.first_aid_kit.tracks[2].id,
  ])
}

data "spotify_search_track" "rem" {
  artist = "R.E.M."
  #  album = "Jolene"
  #  name  = "Early Morning Breeze"
}

data "spotify_track" "kunstfreiheit" {
  spotify_id = "4ioQKdmkdBTkqjhfHeu4YU"
}

data "spotify_track" "eine_gute_nachricht" {
  spotify_id = "2WhSeEawdrxjXelXpWdpzr"
}

data "spotify_search_track" "marc_cohn" {
  artist = "Marc Cohn"
  album = "Marc Cohn"
}

data "spotify_search_track" "first_aid_kit" {
  artist = "First Aid Kit"
}

output "tracks" {
  value = data.spotify_search_track.rem.tracks
}
