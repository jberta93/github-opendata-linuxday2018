SELECT event, repo.id, COUNT(*) as count FROM (
  SELECT JSON_EXTRACT(payload, '$.action') as event, repo.id, repo.name, created_at as ts
  FROM
  [githubarchive:month.201801],
  [githubarchive:month.201802],
  [githubarchive:month.201803],
  [githubarchive:month.201804],
  [githubarchive:month.201805],
  [githubarchive:month.201806],
  [githubarchive:month.201807],
  [githubarchive:month.201808],
  [githubarchive:month.201809],
  [githubarchive:month.201810]
  WHERE type = 'IssuesEvent' AND (repo.id = 23050110 OR repo.id = 9476938)
)
WHERE event = '"closed"' OR event = '"opened"'
GROUP BY event, repo.id
ORDER BY repo.id, event
