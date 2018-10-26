SELECT repo.id,repo.name, COUNT(*) as watchers
FROM (TABLE_DATE_RANGE([githubarchive:day.],
    TIMESTAMP('2018-01-01'),
    TIMESTAMP('2018-10-02')
))
WHERE type = 'WatchEvent' AND
(repo.id = 11730342 OR repo.id = 24195339 OR repo.id = 10270250 OR repo.id = 1801829 OR repo.id = 2126244)
GROUP BY repo.id, repo.name
ORDER BY watchers DESC
LIMIT 1000
