provider "google" {
  credentials = base64decode(var.GOOGLE_CREDENTIALS_BASE64)
  project     = var.GOOGLE_PROJECT
  region      = var.GOOGLE_REGION
}

# Example resource: create a GCP storage bucket
resource "google_storage_bucket" "example_bucket" {
  name     = "terraform-cloud-example-bucket-${random_id.bucket_id.hex}"
  location = var.GOOGLE_REGION
}

resource "random_id" "bucket_id" {
  byte_length = 4
}
