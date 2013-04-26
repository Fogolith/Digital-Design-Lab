package com.example.fragmenttest;

import android.app.Activity;
import android.app.ListFragment;
import android.net.Uri;
import android.os.Bundle;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.ListView;

/**
 * A simple {@link android.support.v4.app.Fragment} subclass. Activities that
 * contain this fragment must implement the
 * {@link HeadlinesFragment.OnFragmentInteractionListener} interface to handle
 * interaction events. Use the {@link HeadlinesFragment#newInstance} factory
 * method to create an instance of this fragment.
 * 
 */
public class HeadlinesFragment extends ListFragment {
	// TODO: Rename parameter arguments, choose names that match
	// the fragment initialization parameters, e.g. ARG_ITEM_NUMBER
	private static final String ARG_PARAM1 = "param1";
	private static final String ARG_PARAM2 = "param2";

	private OnFragmentInteractionListener mListener;

	/**
	 * Use this factory method to create a new instance of this fragment using
	 * the provided parameters.
	 * 
	 * @param param1
	 *            Parameter 1.
	 * @param param2
	 *            Parameter 2.
	 * @return A new instance of fragment HeadlinesFragment.
	 */
	// TODO: Rename and change types and number of parameters
	public static HeadlinesFragment newInstance(String param1, String param2) {
		HeadlinesFragment fragment = new HeadlinesFragment();
		Bundle args = new Bundle();
		args.putString(ARG_PARAM1, param1);
		args.putString(ARG_PARAM2, param2);
		fragment.setArguments(args);
		return fragment;
	}

	public HeadlinesFragment() {
		// Required empty public constructor
	}

	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		if (getArguments() != null) {
			getArguments().getString(ARG_PARAM1);
			getArguments().getString(ARG_PARAM2);
		}
		int layout = android.R.layout.simple_list_item_activated_1;
           
       // Create an array adapter for the list view, using the Ipsum headlines array                   
       setListAdapter(new ArrayAdapter<String>(getActivity(), layout, Ipsum.Headlines));
	}

	   @Override                                                                                        
	   public void onStart() {                                                                          
	       super.onStart();                                                                             
	                                                                                                    
	       // When in two-pane layout, set the listview to highlight the selected list item             
	       // (We do this during onStart because at the point the listview is available.)               
	       if (getFragmentManager().findFragmentById(R.id.article_fragment) != null) {                  
	           getListView().setChoiceMode(ListView.CHOICE_MODE_SINGLE);                                
	       }                                                                                            
	   }

	   @Override                                                                                           
	   public void onListItemClick(ListView l, View v, int position, long id) {                            
	       // Notify the parent activity of selected item                                                  
	       mListener.onArticleSelected(position);                                                          
	                                                                                                       
	       // Set the item as checked to be highlighted when in two-pane layout                            
	       getListView().setItemChecked(position, true);                                                   
	   }

	@Override
	public void onAttach(Activity activity) {
		super.onAttach(activity);
		try {
			mListener = (OnFragmentInteractionListener) activity;
		} catch (ClassCastException e) {
			throw new ClassCastException(activity.toString()
					+ " must implement OnFragmentInteractionListener");
		}
	}

	@Override
	public void onDetach() {
		super.onDetach();
		mListener = null;
	}

	/**
	 * This interface must be implemented by activities that contain this
	 * fragment to allow an interaction in this fragment to be communicated to
	 * the activity and potentially other fragments contained in that activity.
	 * <p>
	 * See the Android Training lesson <a href=
	 * "http://developer.android.com/training/basics/fragments/communicating.html"
	 * >Communicating with Other Fragments</a> for more information.
	 */
	public interface OnFragmentInteractionListener {
		/** Called by HeadlinesFragment when a list item is selected */                              
		public void onArticleSelected(int position);
		public void onFragmentInteraction(Uri uri);
	}

}