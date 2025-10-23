<?php

namespace App\Helper;

use Illuminate\Support\Facades\File;
use Illuminate\Database\Eloquent\Model;

class ModelHelper
{
    public static function getAllModels($directory = null)
    {
        $models = [];
        $directory = $directory ?: app_path('Models');

        foreach (File::allFiles($directory) as $file) {
            $namespace = 'App\\Models\\';
            $class = $namespace . str_replace(['/', '.php'], ['\\', ''], $file->getRelativePathname());

            if (class_exists($class) && is_subclass_of($class, Model::class)) {
                $models[] = $class;
            }
        }

        return $models;
    }
}
