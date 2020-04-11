# frozen_string_literal: true

class Jsonapi::ApplicationController < ApplicationController
  include Jaf::Base

  self.ignore_namespaces = %w[Jsonapi]

  def serializer
    "Jsonapi::#{resource_model}Serializer".constantize
  end

  def serialize(resource, options = {})
    serializer.new(resource, options).serialized_json
  end

  def create_resource(new_resource, attributes)
    new_resource.attributes = attributes
    new_resource.save
    new_resource
  end

  def update_resource(resource, attributes)
    resource.attributes = attributes
    resource.save
    resource
  end

  def destroy_resource(resource)
    resource.destroy
    resource
  end
end
