﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;

namespace CinemaTickets.Models
{
    class ProjectionRepository
    {
        public static string connectionString = System.Configuration
            .ConfigurationManager
            .ConnectionStrings["CinemaTicketsConnectionString"]
            .ConnectionString;

        public static Projection Get(int id)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                using (SqlCommand command = new SqlCommand(
                    "SELECT p.id, m.id, m.title, m.subtitle, m.description, m.trailer_url," +
                    "c.id, c.name, g.id, g.name, m.duration, m.producer, m.actors " +
                    "t.id, t.name, t.price, r.id, r.name, p.time " +
                    "FROM projections p " +
                    "LEFT JOIN movies m ON m.id = p.movie_id " +
                    "LEFT JOIN movie_types t ON t.id = p.movie_type_id " +
                    "LEFT JOIN room r ON r.id = p.room_id " +
                    "LEFT JOIN categories c ON c.id = m.category_id" +
                    "LEFT JOIN genres g ON g.id = m.genre_id" +
                    "where id = @id", con))
                {
                    command.Parameters.Add("@id", SqlDbType.Int);
                    command.Parameters["@id"].Value = id;
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            return new Projection(
                                reader.GetInt32(0), //projection id
                                new Movie(
                                    reader.GetInt32(1), // id
                                    reader.GetString(2).Trim(), // title
                                    reader.GetString(3).Trim(), // subtitle
                                    reader.GetString(4).Trim(), // description
                                    reader.GetString(5).Trim(), // trailer_url
                                    new Category(
                                        reader.GetInt32(6), // category id
                                        reader.GetString(7).Trim() // category name
                                    ),
                                    new Genre(
                                        reader.GetInt32(8), // genre id
                                        reader.GetString(9).Trim() // genre name
                                        ),
                                    reader.GetFloat(10), // duration
                                    reader.GetString(11).Trim(), // producer
                                    reader.GetString(12).Trim() // actors
                                ),
                                new MovieType(reader.GetInt32(13), reader.GetString(14).Trim()),
                                new Room(reader.GetInt32(15), reader.GetString(16).Trim()),
                                reader.GetDateTime(17)
                            );
                        }
                    }
                }
            }

            return null;
        }
        public static List<Projection> GetAll()
        {
            List<Projection> projections = new List<Projection>();
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                using (SqlCommand command = new SqlCommand(
                    "SELECT p.id, m.id, m.title, m.subtitle, m.description, m.trailer_url," +
                    "c.id, c.name, g.id, g.name, m.duration, m.producer, m.actors " +
                    "t.id, t.name, t.price, r.id, r.name, p.time " +
                    "FROM projections p " +
                    "LEFT JOIN movies m ON m.id = p.movie_id " +
                    "LEFT JOIN movie_types t ON t.id = p.movie_type_id " +
                    "LEFT JOIN room r ON r.id = p.room_id " +
                    "LEFT JOIN categories c ON c.id = m.category_id " +
                    "LEFT JOIN genres g ON g.id = m.genre_id", con))
                {
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            projections.Add(new Projection(
                                reader.GetInt32(0), //projection id
                                new Movie(
                                    reader.GetInt32(1), // id
                                    reader.GetString(2).Trim(), // title
                                    reader.GetString(3).Trim(), // subtitle
                                    reader.GetString(4).Trim(), // description
                                    reader.GetString(5).Trim(), // trailer_url
                                    new Category(
                                        reader.GetInt32(6), // category id
                                        reader.GetString(7).Trim() // category name
                                    ),
                                    new Genre(
                                        reader.GetInt32(8), // genre id
                                        reader.GetString(9).Trim() // genre name
                                        ),
                                    reader.GetFloat(10), // duration
                                    reader.GetString(11).Trim(), // producer
                                    reader.GetString(12).Trim() // actors
                                ),
                                new MovieType(reader.GetInt32(13), reader.GetString(14).Trim()),
                                new Room(reader.GetInt32(15), reader.GetString(16).Trim()),
                                reader.GetDateTime(17)
                            ));
                        }
                    }
                }
            }

            return projections;
        }

        public static void Add(int movieId, int movieTypeId, int roomId, DateTime time)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                using (SqlCommand command = new SqlCommand(
                    "INSERT INTO projections (movie_id, movie_type_id, room_id, time) " +
                    "VALUES(@movie_id, @movie_type_id, @room_id, time)", con))
                {
                    command.Parameters.Add("@movie_id", SqlDbType.Int);
                    command.Parameters["@movie_id"].Value = movieId;
                    command.Parameters.Add("@movie_type_id", SqlDbType.Int);
                    command.Parameters["@movie_type_id"].Value = movieTypeId;
                    command.Parameters.Add("@room_id", SqlDbType.Int);
                    command.Parameters["@room_id"].Value = roomId;
                    command.Parameters.Add("@time", SqlDbType.DateTime);
                    command.Parameters["@time"].Value = time;

                    command.ExecuteNonQuery();
                }
            }
        }

        public static void Update(Projection projection)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                using (SqlCommand command = new SqlCommand(
                    "UPDATE projections SET movie_id = @movie_id, movie_type_id = @movie_type_id, " +
                    "room_id = @room_id, time = @time) " +
                    "WHERE id= @id", con))
                {
                    command.Parameters.Add("@id", SqlDbType.Int);
                    command.Parameters["@id"].Value = projection.Id;
                    command.Parameters.Add("@movie_id", SqlDbType.Int);
                    command.Parameters["@movie_id"].Value = projection.Movie.Id;
                    command.Parameters.Add("@movie_type_id", SqlDbType.Int);
                    command.Parameters["@movie_type_id"].Value = projection.MovieType.Id;
                    command.Parameters.Add("@room_id", SqlDbType.Int);
                    command.Parameters["@room_id"].Value = projection.Room.Id;
                    command.Parameters.Add("@time", SqlDbType.DateTime);
                    command.Parameters["@time"].Value = projection.Time;

                    command.ExecuteNonQuery();
                }
            }
        }

        public static void Remove(int id)
        {
            using (SqlConnection con = new SqlConnection(connectionString))
            {
                con.Open();
                using (SqlCommand command = new SqlCommand("DELETE FROM projections WHERE id = @id", con))
                {
                    command.Parameters.Add("@id", SqlDbType.Int);
                    command.Parameters["@id"].Value = id;

                    command.ExecuteNonQuery();
                }
            }
        }
    }
}