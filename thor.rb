def normalize_angle(angle)
  (angle.to_i + 360) % 360
end

def angle_to_direction(angle)
  boundaries = [22.5, 67.5, 112.5, 157.5, 202.5, 247.5, 292.5, 337.5]
  directions = ['NE', 'N', 'NW', 'W', 'SW', 'S', 'SE', 'E']

  for i in (0...(boundaries.size - 1)) do
    return directions[i] if (boundaries[i]...boundaries[i+1]).include?(angle)
  end

  return 'E'
end