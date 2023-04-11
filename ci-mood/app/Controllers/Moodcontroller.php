<?php

namespace App\Controllers;

use CodeIgniter\Exceptions\PageNotFoundException;
use App\Models\Moodmodel;

class Moodcontroller extends BaseController
{
    public function index()
    {
        $model = model(Moodmodel::class);

        $data = [
            'mood'  => $model->getMood(),
            'title' => 'Your moods',
        ];

        return view('templates/header', $data)
            . view('mood/index')
            . view('templates/footer');
    }

    public function view($slug = null)
    {
        $model = model(Moodmodel::class);

        $data['news'] = $model->getMood($slug);

        if (empty($data['mood'])) {
            throw new PageNotFoundException('Cannot find the mood item: ' . $slug);
        }

        $data['title'] = $data['news']['title'];

        return view('templates/header', $data)
            . view('mood/view')
            . view('templates/footer');
    }

    public function create()
    {
        helper('form');

        // Checks whether the form is submitted.
        if (! $this->request->is('post')) {
            // The form is not submitted, so returns the form.
            return view('templates/header', ['title' => 'What is your mood?'])
                . view('mood/create')
                . view('templates/footer');
        }

        $post = $this->request->getPost(['mood', 'plek', 'beschrijving']);

        // Checks whether the submitted data passed the validation rules.
        if (! $this->validateData($post, [
            'mood'  => 'required|max_length[5000]|min_length[1]',
            'plek'  => 'max_length[5000]|min_length[0]',
            'beschrijving'  => 'max_length[5000]|min_length[0]',
        ])) {
            // The validation fails, so returns the form.
            return view('templates/header', ['title' => 'What is your mood?'])
                . view('mood/create')
                . view('templates/footer');
        }

        $model  = model(Moodmodel::class);
        $user   = auth()->user()->id;

        $model->save([
            'user'  => $user,
            'mood'  => $post['mood'],
            'plek'  => $post['plek'],
            'beschrijving'  => $post['beschrijving']
        ]);

        return view('templates/header', ['title' => 'What is your mood?'])
            . view('mood/success')
            . view('templates/footer');
    }
}