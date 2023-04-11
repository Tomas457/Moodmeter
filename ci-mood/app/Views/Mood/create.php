<style>
    .container {
        display: grid;
        grid-template-columns: 20%;
        align-items: center;
        justify-content: center;
        height: auto;
    }

    .createbutton {
        text-align: center;
    }

    /* .moodbutton {
        position: absolute;
        margin: 0;
        padding:5px;
        font-size: 130%;
    } */
    
    input {
        padding:5px;
        font-size: 110%;
    }

    a {
        text-decoration: none;
        color: black;
    }
</style>

<!-- <div class="moodbutton">
    <button>
        <a type="button" href="http://localhost:8080/mood">Back</a>
    </button>
</div> -->

<?= session()->getFlashdata('error') ?>
<?= validation_list_errors() ?>


<form action="/mood/create" method="post">
    <?= csrf_field() ?>

    <!-- <label for="datum"></label>
    <input type="datetime-local" name="datum" value="<?= set_value('datum') ?>">
    <br> -->

    <!-- <label for="body">Text</label>
    <textarea name="body" cols="45" rows="4"><?= set_value('mood') ?></textarea>
    <br> -->
<div class="container">
    <label for="mood">Your mood</label>
    <select id="mood" name="mood">
        <option <?= set_value('mood') ?>>Blij</option>
        <option <?= set_value('mood') ?>>Boos</option>
        <option <?= set_value('mood') ?>>Verdrietig</option>
        <option <?= set_value('mood') ?>>Neutraal</option>
    </select>
    <br>

    <label for="plek">Your location</label>
    <select id="plek" name="plek">
        <option <?= set_value('plek') ?>>huis</option>
        <option <?= set_value('plek') ?>>werk</option>
        <option <?= set_value('plek') ?>>school</option>
    </select>
    <br>

    <label for="beschrijving">A description</label>
    <textarea name="beschrijving" cols="45" rows="4" placeholder="text"><?= set_value('beschrijving') ?></textarea>
    <br>

    <div class="createbutton">
        <input type="submit" name="submit" value="Create">
    </div>
</form>
</div>
