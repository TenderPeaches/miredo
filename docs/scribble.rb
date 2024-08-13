ActiveRecord::Base.connection.execute("SELECT COUNT(`sp1`.`id`) FROM `songs`
    LEFT JOIN `song_plays` AS `sp1` ON `sp1`.`user_id` = ? AND `sp1`.`by_heart` = true
    GROUP BY `songs`.`id`", [1])

Song.joins(:song_plays).where("song_plays.user_id = ? AND song_plays.by_heart = true", [1])