class User < ActiveRecord::Base

  has_secure_password

  has_many :statuses

  has_attached_file :photo,
     					styles: { medium: "300x300#", thumb: "100x100#" },
   					default_url: ":style/missing.jpg",
                         :storage => :s3,
                         url: ":s3_domain_url",
                         path: "/:class/:attachment/:id_partition/:style/:filename",
                         s3_region: 'us-east-1',
                         :s3_credentials => Proc.new{|a| a.instance.s3_credentials }

     def s3_credentials
       {
         :bucket => ENV["S3_BUCKET_NAME"],
         :access_key_id => ENV["S3_ACCESS_KEY_ID"],
         :secret_access_key => ENV["S3_SECRET_ACCESS_KEY"]
       }
     end
     validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
end
