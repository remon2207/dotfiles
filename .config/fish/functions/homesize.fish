function homesize
  du -sm ./{*,.*} | sort -n
end
