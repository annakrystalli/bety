module CoordinateSearch
  # degrees lat ~ miles/69.1
  # degrees lng ~ miles/53.0 (at the 40th parallels)
  def coordinate_search(params)
    if (params[:mapDisplayed] == "true")
      lat = params[:lat][/-?\d+\.?\d*/].to_f
      lon = params[:lng][/-?\d+\.?\d*/].to_f
      if (params[:searchingBySite] == "true")
        radius = 1 # give leeway in case of rounding errors
      else # == "false"
        radius = params[:radius].to_i
      end

      where({ :lat => (lat - (radius/69.1))..(lat + (radius/69.1)),
              :lon => (lon - (radius/53.0))..(lon + (radius/53.0)) })
    else
      where({})
    end

  end

end