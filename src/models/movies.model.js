const db = require('../helpers/db.helper')

exports.selectAllMovies = (callback) => {
  return db.query('SELECT * FROM movies', callback)
}

exports.selectMovie = (param, callback) => {
  return db.query(`SELECT * FROM movies WHERE id=${param.id}`, callback)
}

exports.insertMovie = (data, callback) => {
  const sql ='INSERT INTO movies ("title", "picture", "releaseDate", "director", "duration", "synopsis") VALUES ($1, $2, $3, $4, $5, $6) RETURNING *';

  const values = [data.title, data.picture, data.releaseDate, data.director, data.duration, data.synopsis]

  return db.query(sql, values, callback)
}

exports.patchUser = (data, param, callback) => {
  const sql = `UPDATE movies SET "title"=COALESCE(NULLIF($1,''), "title"), "picture"=COALESCE(NULLIF($2,''), "picture"), "releaseDate"=COALESCE(NULLIF($3, '1970-01-01'::timestamptz), "releaseDate"), "director"=COALESCE(NULLIF($4,''), "director"), "duration"=COALESCE(NULLIF($5, '00:00:00'::time), "duration"), "synopsis"=COALESCE(NULLIF($6,''), "synopsis") WHERE id=$7 RETURNING *`;

  const values = [data.title, data.picture, data.releaseDate, data.director, data.duration, data.synopsis, param.id]

  return db.query(sql, values, callback)
}

exports.deleteMovie = (param, callback) => {
  return db.query(`DELETE FROM movies WHERE id=${param.id} RETURNING *`, callback)
}
