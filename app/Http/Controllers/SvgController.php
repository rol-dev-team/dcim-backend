<?php

namespace App\Http\Controllers;


use Illuminate\Http\Request;
use App\Models\Svg;
use DOMDocument;
use DOMXPath;
use libxml_use_internal_errors;
use libxml_clear_errors;

class SvgController extends Controller
{


//    public function store(Request $request)
//    {
//        // 1. Validate incoming request data
//        $request->validate([
//            'datacenter_id' => 'required|exists:data_center_creations,id',
//            'svg_file' => 'required|file|mimes:svg,xml',
//        ]);
//
//        $file = $request->file('svg_file');
//        $svgContent = file_get_contents($file->getRealPath());
//
//        // 2. Load SVG content into DOMDocument for parsing
//        $dom = new DOMDocument();
//        libxml_use_internal_errors(true); // Enable internal error handling for XML parsing
//        $dom->loadXML($svgContent);
//        libxml_clear_errors(); // Clear errors after checking
//
//        // 3. Use XPath with SVG namespace to query elements
//        $xpath = new DOMXPath($dom);
//        // Register the SVG namespace, crucial for querying SVG elements correctly
//        $xpath->registerNamespace('svg', 'http://www.w3.org/2000/svg');
//
//        // 4. Get all <path> tags
//        $pathTags = $xpath->query('//svg:path');
//
//        $pathData = [];
//        $circlePathData = []; // To store paths that represent circles
//
//        // Iterate through each found path tag
//        foreach ($pathTags as $path) {
//            $pathXml = $dom->saveXML($path);
//            $pathData[] = $pathXml; // Store all paths in 'path' field
//
//            // Get the 'd' attribute (path data) for analysis
//            $dAttribute = $path->getAttribute('d');
//
//            // Heuristic to identify specific circle-like paths based on coordinate values:
//            // This regex looks for a 'c' or 'C' (cubic Bezier curve command)
//            // followed by any characters, then specifically looks for the values '181.5' or '100.239'.
//            // This is more precise for the type of circles you want to capture (e.g., path33, path40).
//            $isSpecificCirclePath = preg_match('/[cC].*?(?:181\.5|100\.239)/', $dAttribute);
//
//            // If the specific pattern is found, consider it a circle-like path
//            if ($isSpecificCirclePath) {
//                $circlePathData[] = $pathXml;
//            }
//        }
//
//        // 5. Save to database
//        Svg::create([
//            'datacenter_id' => $request->datacenter_id,
//            'svg_content' => $svgContent,
//            'path' => implode('', $pathData),
//            'circle_path' => implode('', $circlePathData), // This will now contain specific paths
//        ]);
//
//        return response()->json(['message' => 'SVG uploaded successfully.']);
//    }


    public function store(Request $request)
    {
        // 1. Validate incoming request data
        $request->validate([
            'datacenter_id' => 'required|exists:data_center_creations,id',
            'svg_file' => 'required|file|mimes:svg,xml',
        ]);

        $file = $request->file('svg_file');
        $svgContent = file_get_contents($file->getRealPath());

        // 2. Load SVG content into DOMDocument for parsing
        $dom = new DOMDocument();
        libxml_use_internal_errors(true); // Enable internal error handling for XML parsing
        $dom->loadXML($svgContent);
        libxml_clear_errors(); // Clear errors after checking

        // 3. Use XPath with SVG namespace to query elements
        $xpath = new DOMXPath($dom);
        // Register the SVG namespace, crucial for querying SVG elements correctly
        $xpath->registerNamespace('svg', 'http://www.w3.org/2000/svg');

        // 4. Get all <path> tags
        $pathTags = $xpath->query('//svg:path');

        $pathData = [];
        $circlePathIds = []; // To store IDs of paths that represent circles

        // Iterate through each found path tag
        foreach ($pathTags as $path) {
            $pathXml = $dom->saveXML($path);
            $pathData[] = $pathXml; // Store all paths in 'path' field

            // Get the 'd' attribute (path data) for analysis
            $dAttribute = $path->getAttribute('d');

            // Heuristic to identify specific circle-like paths based on coordinate values:
            // This regex looks for a 'c' or 'C' (cubic Bezier curve command)
            // followed by any characters, then specifically looks for the values '181.5' or '100.239'.
            // This is more precise for the type of circles you want to capture (e.g., path33, path40).
            $isSpecificCirclePath = preg_match('/[cC].*?(?:181\.5|100\.239)/', $dAttribute);

            // If the specific pattern is found, consider it a circle-like path
            if ($isSpecificCirclePath) {
                // Get the 'id' attribute of the path
                $circleId = $path->getAttribute('id');
                if (!empty($circleId)) { // Ensure the id attribute exists and is not empty
                    $circlePathIds[] = $circleId;
                }
            }
        }

        // 5. Save to database
        Svg::create([
            'datacenter_id' => $request->datacenter_id,
            'svg_content' => $svgContent,
            'path' => implode('', $pathData),
            // Store comma-separated IDs or a JSON array of IDs
            // Using JSON array is generally more flexible
            'circle_path' => json_encode($circlePathIds),
        ]);

        return response()->json(['message' => 'SVG uploaded successfully.']);
    }

    public function showByDataCenter($datacenter_id)
    {
        $svg = Svg::where('datacenter_id', $datacenter_id)->latest()->first();

        if (!$svg) {
            return response()->json(['message' => 'No SVG found for this data center.'], 404);
        }

        return response()->json([
            'svg_content' => $svg->svg_content,
        ]);
    }

    /**
     * Helper function to detect if a path is actually a circle
     */
//    protected function isCirclePath(string $pathData): bool
//    {
//        // This is a simplified check - you might need to adjust based on your SVG structure
//        // Looks for path commands that typically represent circles/ellipses
//        return preg_match('/a\s*[\d\.]+\s*[\d\.]+\s*[\d\.]+\s*[\d\.]+\s*[\d\.]+\s*[\d\.]+\s*[\d\.]+/i', $pathData);
//    }

}
