
preload:

preload loads the associated records in separate database queries. 
It is suitable when you want to load associated records in separate queries to avoid the N+1 query problem. However,
it does not perform any optimization to minimize the number of queries.

Example:

Suppose you have Article and Comment models where each article has many comments.


# Controller
@articles = Article.preload(:comments)

# View
@articles.each do |article|
  puts article.title
  article.comments.each do |comment|
    puts "- #{comment.content}"
  end
end
In this example, Article.preload(:comments) will execute two separate queries: 
one to fetch all articles and another to fetch all comments associated with those articles. 
It will then load the associated comments into memory, allowing you to access them without additional database queries.



eager_load:

eager_load also loads associated records, but it does so using SQL joins to fetch all the data in a single query.
It is suitable when you want to optimize database queries by fetching associated records in a single query.

Example:

Continuing with the same Article and Comment models:


# Controller
@articles = Article.eager_load(:comments)

# View
@articles.each do |article|
  puts article.title
  article.comments.each do |comment|
    puts "- #{comment.content}"
  end
end
In this example, Article.eager_load(:comments) will execute a single query using SQL joins to fetch all articles along with their associated comments. 
It will then load the combined data into memory, allowing you to access both articles and comments without additional database queries.

In summary, preload loads associated records in separate queries without optimization, while eager_load fetches all the data in a single query using SQL joins.
The choice between them depends on your specific use case and performance requirements.