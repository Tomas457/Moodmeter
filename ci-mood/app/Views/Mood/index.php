<head>

    <!-- adding datatables CSS -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.2/css/jquery.dataTables.min.css">
    <!-- adding datatables JQUERY -->
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>

    <script> 
        $(document).ready( function () {
            $('#myTable').DataTable({
            pageLength : 5,
            lengthMenu: [ 5, 10, 25, 50, 75, 100 ]
            });
        });
    </script>

  <style>
    .container{
        display: grid;
        grid-template-columns: auto;
        background-color: black;
        color: white;
        border: blue 2px solid;
        padding: 2px;
    }

    .box{
        border: blue 1px solid;
        width: auto;
        padding: 2px;
    }

    tr, th ,td {
        padding: 2px;
        margin-left: 25px;
    }

    .button {
        -ms-transform: translateX(-50%);
        transform: translateX(-50%); 
        position: absolute;
        margin: 0;
        left: 50%;
    }
    
    button {
        padding:5px;
        font-size: 110%;
    }
    
    a {
        text-decoration: none;
        color: black;
    }
    </style>
</head>

<?php 

    /*if (!empty($mood) && is_array($mood)): 
        foreach ($mood as $mood_item){
            "<div class='container'>
                    <?= esc($mood_item->datum) 
                    <?= esc($mood_item->mood) 
            </div>";
    } else {
        "<h3>No moods</h3>";
        "<p>Unable to find any moods for you.</p>";
    }  */

    $rows = '';
    foreach ($mood as $mood_item){
        $rows .=    "<tr>
                        <td>{$mood_item->datum}</td>
                        <td>{$mood_item->mood}</td>
                        <td>{$mood_item->plek}</td>
                        <td>{$mood_item->beschrijving}</td>
                    </tr>";
    };
?>

<div>
    <table id="myTable">
        <thead>
            <tr>
                <th>Datum</th>
                <th>Mood</th>
                <th>Plek</th>
                <th>Beschrijving</th>
            </tr>
        </thead>
        <tbody>
            <?php 
                echo $rows;
            ?>
        </tbody>
    </table>
</div>

<div class="button">
    <button>
        <a type="button" href="http://localhost:8080/mood/create">Create</a>
    </button>
</div>

<div style="margin-bottom: 75px;width:auto;"></div>

<!-- adding datatables JAVASCRIPT-->
<script src="https://cdn.datatables.net/1.13.2/js/jquery.dataTables.min.js"></script>