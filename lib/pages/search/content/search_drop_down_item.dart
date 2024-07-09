import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:landlord/data/model/cities_model.dart';
import 'package:landlord/data/model/country_model.dart';
import 'package:landlord/data/model/state_model.dart';
import 'package:landlord/data/provider/search_provider.dart';
import 'package:landlord/utils/theme/app_colors.dart';
import 'package:provider/provider.dart';

class SearchDropDownItem extends StatelessWidget {
  final SearchProvider provider;
  const SearchDropDownItem({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 30.h,
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 0),
            decoration: BoxDecoration(
                color: greyColor.withOpacity(0.04),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xffD9D9D9))),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<CountryData?>(
                hint: const Text('Select Country'),
                isExpanded: true,
                value: provider.countryModel,
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  size: 16,
                ),
                elevation: 16,
                style: TextStyle(
                    color: const Color(
                      0xff8A8A8A,
                    ),
                    fontSize: 12.r),
                onChanged: (CountryData? selectCountry) {
                  if (selectCountry != null) {
                    provider.onCountrySelect(country: selectCountry);
                    context
                        .read<SearchProvider>()
                        .getState(context, selectCountry.code!);
                    provider.getAreaWiseSearchData(
                        context: context,
                        cityId: "",
                        countryCode: provider.countryCode!,
                        stateCode: "");
                  }
                  // setState(() {
                  //   dropdownValue1 = newValue!;
                  // });
                },
                items: provider.countryData
                    .map<DropdownMenuItem<CountryData>>((CountryData value) {
                  return DropdownMenuItem<CountryData>(
                    value: value,
                    child: Text(value.name ?? ''),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: Container(
            height: 30.h,
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 0),
            decoration: BoxDecoration(
                color: greyColor.withOpacity(0.04),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xffD9D9D9))),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<StateData?>(
                hint: const Text('Select State'),
                isExpanded: true,
                value: provider.stateModel,
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  size: 16,
                ),
                elevation: 16,
                style: TextStyle(
                    color: const Color(
                      0xff8A8A8A,
                    ),
                    fontSize: 12.r),
                onChanged: (StateData? state) {
                  if (state != null) {
                    provider.onStateSelect(stateData: state);
                    provider.getCities(context, state.code);
                    provider.getAreaWiseSearchData(
                        context: context,
                        cityId: '',
                        countryCode: provider.countryCode!,
                        stateCode: provider.stateCode!);
                  }
                },
                items: provider.stateData
                    .map<DropdownMenuItem<StateData>>((StateData value) {
                  return DropdownMenuItem<StateData>(
                    value: value,
                    child: Text(value.name ?? ''),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: Container(
            height: 30.h,
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 0),
            decoration: BoxDecoration(
                color: greyColor.withOpacity(0.04),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xffD9D9D9))),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<CityData?>(
                hint: const Text("Select City"),
                isExpanded: true,
                value: provider.citiesModels,
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  size: 16,
                ),
                elevation: 16,
                style: TextStyle(
                    color: const Color(
                      0xff8A8A8A,
                    ),
                    fontSize: 12.r),
                onChanged: (CityData? city) {
                  if (city != null) {
                    provider.onCitySelect(cityData: city);
                    provider.getAreaWiseSearchData(
                        context: context,
                        cityId: city.id.toString(),
                        countryCode: provider.countryCode!,
                        stateCode: provider.stateCode!);
                  }
                  // setState(() {
                  //   dropdownValue1 = newValue!;
                  // });
                },
                items: provider.cityData
                    .map<DropdownMenuItem<CityData>>((CityData value) {
                  return DropdownMenuItem<CityData>(
                    value: value,
                    child: Text(value.name ?? ''),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
