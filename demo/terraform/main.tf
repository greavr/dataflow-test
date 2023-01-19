# ----------------------------------------------------------------------------------------------------------------------
# Main modules
# ----------------------------------------------------------------------------------------------------------------------
module "vpc" {
    source      = "./modules/vpc"
    project_id  = var.project_id
    region      = var.region
    
} 

module "gcs" {
  source = "./modules/gcs"
  project_id = var.project_id
  region = var.region
  bucket_name = var.gcs_bucket_name
}

module "kms" {
  source = "./modules/kms"
  project_id = var.project_id
  kms-name = var.kms_key_name

}

module "dataflow" {
  source                = "./modules/dataflow"
  project_id            = var.project_id
  
  region                = var.region
  zone                  = var.zone

  network               = module.vpc.vpc.id
  subnet                = module.vpc.subnets.id

  kms_key_name          = module.kms.kms_key.name
  temp_gcs_location     = module.gcs.bucket_name.name



  depends_on = [
    module.vpc,
    module.gcs,
    module.kms
  ]
}