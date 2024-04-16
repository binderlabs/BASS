<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Item; 
use App\Models\Transaction;
use Illuminate\Support\Facades\DB;

class MarketplaceController extends Controller
{
    // Method to list all items
    public function listItems()
    {
        // Retrieve all items from the database
        $items = Item::all();

        // Return the items as a JSON response
        return response()->json($items);
    }

    // Your existing bulkPurchase method
    public function bulkPurchase(Request $request)
    {
        $purchases = $request->input('purchases', []);
        $uuid = $request->input('uuid'); // Retrieve the UUID from the request

        DB::beginTransaction();
        try {
            foreach ($purchases as $purchase) {
                $item = Item::findOrFail($purchase['item_id']);
                if ($item->stock < $purchase['quantity']) {
                    return response()->json(['error' => 'Not enough stock for item: ' . $item->name], 400);
                }

                $item->stock -= $purchase['quantity'];
                $item->save();

                // Record the transaction
                Transaction::create([
                    'item_id' => $item->id,
                    'quantity' => $purchase['quantity'],
                    // Assuming you have a 'user_uuid' field to associate the transaction
                    'user_uuid' => $uuid 
                ]);
            }

            DB::commit();
            return response()->json(['message' => 'Purchase successful.', 'uuid' => $uuid]);
        } catch (\Exception $e) {
            DB::rollBack();
            // Log the error for debugging
            \Log::error($e->getMessage());
            return response()->json(['error' => 'An error occurred during the purchase.'], 500);
        }
    }
}