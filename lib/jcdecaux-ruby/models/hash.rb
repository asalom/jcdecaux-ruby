class Hash
  def convert_to_type(type)
    JSON.parse to_json, object_class: type
  end
end