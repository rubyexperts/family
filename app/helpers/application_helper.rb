module ApplicationHelper


    def image_file_name(patient_image)
       file = File.basename(patient_image.image.to_s.gsub(/\\/, '/')) if !patient_image.nil?
       file
    end
  
end
