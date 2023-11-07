# resource "google_service_account" "mike-name" {
#   account_id = "mike-name"
#   display_name = "SA"
# }

resource "google_project_iam_member" "mike-owner" {
  project = "gke-test-tf1"
  role    = "roles/editor"
  member  = "serviceAccount:mike-test-gke1@gke-test-tf1.iam.gserviceaccount.com"// "serviceAccount:${google_service_account.mike-name.email}"
}
