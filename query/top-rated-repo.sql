SELECT repo.id,repo.name, COUNT(*) as watchers
FROM (TABLE_DATE_RANGE([githubarchive:day.],
    TIMESTAMP('2018-01-01'),
    TIMESTAMP('2018-10-25')
))
WHERE type = 'WatchEvent'
GROUP BY repo.id, repo.name
ORDER BY watchers DESC
LIMIT 30
