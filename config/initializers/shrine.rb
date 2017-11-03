require "shrine"
require "shrine/storage/file_system"
require "shrine/storage/s3"
require "image_processing/mini_magick"

#Uses local storage of images for development and switches to AWS when deployed.

use_files = Rails.env.development? || Rails.env.test?

if use_files
  Shrine.storages = {
    cache: Shrine::Storage::FileSystem.new("public", prefix: "uploads/cache"),
    store: Shrine::Storage::FileSystem.new("public", prefix: "uploads/store"),
  }

else

  s3_options = {
    access_key_id:     ENV.fetch("S3_ACCESS_KEY_ID"),
    secret_access_key: ENV.fetch("S3_SECRET_ACCESS_KEY"),
    region:            ENV.fetch("S3_REGION"),
    bucket:            ENV.fetch("S3_BUCKET"),
  }
  
  Shrine.storages = {
    cache: Shrine::Storage::S3.new(prefix: "cache", **s3_options),
    store: Shrine::Storage::S3.new(prefix: "store", **s3_options),
  }
  
end
