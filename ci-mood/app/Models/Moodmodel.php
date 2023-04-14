<?php

namespace App\Models;

use CodeIgniter\Model;

class Moodmodel extends Model
{
    protected $table = 'mood';

    protected $allowedFields = ['datum', 'mood', 'user', 'plek', 'beschrijving'];

    public function getMood($slug = false)
    {
        $user = auth()->user()->id;
        $db = db_connect();
        $sql = "SELECT DISTINCT datum, mood, moodid, user, plek, beschrijving FROM mood WHERE user = $user ORDER BY datum ASC;";

        $selection = $db->query($sql, [$user]);

        return $selection->getResult();
    }
}