class PictureFile < ActiveRecord::Base
  # attr_accessible :title, :body
  def self.save(upload, newfile)
    name =  upload['datafile'].original_filename
    directory = "public/data"
    # create the file path
    path = File.join(directory, newfile)
    # write the file
    File.open(path, "wb") { |f| f.write(upload['datafile'].read) }
  end
end
