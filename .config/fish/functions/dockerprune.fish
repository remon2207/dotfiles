function dockerprune
  docker volume prune
  docker system prune -fa
end
